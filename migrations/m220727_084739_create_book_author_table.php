<?php

use yii\db\Migration;

/**
 * Handles the creation of table `{{%book_author_category}}`.
 */
class m220727_084739_create_book_author_table extends Migration
{
    /**
     * {@inheritdoc}
     */
    public function safeUp()
    {
        $this->createTable('{{%book-author}}', [
            'id' => $this->primaryKey(),
            'id_book' => $this->integer()->notNull(),
            'id_author' => $this->integer()->notNull(),
        ]);
        $this->addForeignKey(
            'chain_to_book',
            '{{%book-author}}',
            'id_book',
            'books',
            'id',
            'CASCADE'
        );
        $this->addForeignKey(
            'chain_to_author',
            '{{%book-author}}',
            'id_author',
            'author',
            'id',
            'CASCADE'
        );
    }

    /**
     * {@inheritdoc}
     */
    public function safeDown()
    {
        $this->dropTable('{{%book-author}}');
    }
}
